import numpy as np
import matplotlib.pyplot as plt
import torch
from scipy.io import wavfile

fs, x = wavfile.read("./data/snare.wav")

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

print("device", device)

x = torch.tensor(x[:, 0].astype(np.float32), device=device, requires_grad=False)

x = x / torch.max(torch.abs(x))

nb_frequencies = 1000

f_up = 22050
f_down = 0
sp = 0.0000




t = torch.linspace(0, len(x), len(x), device=device)

class Model(torch.nn.Module):
    def __init__(self):
        super(Model, self).__init__()

        self.z = torch.nn.Parameter(torch.rand((nb_frequencies,1), device=device))
        self.a_c = torch.nn.Parameter(torch.randn(size=(nb_frequencies,1), device=device) * 1E-3)
        self.b_c = torch.nn.Parameter(torch.randn(size=(nb_frequencies,1), device=device) * 1E-3)
        self.a_s = torch.nn.Parameter(torch.randn(size=(nb_frequencies,1), device=device) * 1E-3)
        self.b_s = torch.nn.Parameter(torch.randn(size=(nb_frequencies,1), device=device) * 1E-3)
        self.frequencies = self.make_freq()

    def make_freq(self):
        return self.z * (f_up - f_down) + f_down

    def forward(self, t):
        env_c = self.b_c * torch.exp( - t * self.a_c ** 2 )
        env_s = self.b_s * torch.exp( - t * self.a_s ** 2 )
        

        self.frequencies = self.make_freq()
        c = torch.cos(2 * np.pi * self.frequencies * t[None, :] / fs) * env_c
        s = torch.sin(2 * np.pi * self.frequencies * t[None, :] / fs) * env_s

        return torch.mean(c, dim=0) + torch.mean(s, dim=0)



model = Model()

optimizer = torch.optim.Adam(model.parameters(), lr=1e-4)

#import matplotlib.pyplot as plt
#plt.hist(model.frequencies.detach().cpu().numpy(), bins=100)
#plt.show()


for step in range(10**6):
        
    optimizer.zero_grad()
    y = model.forward(t)

    loss = torch.mean((y - x) ** 2) + sp * torch.mean(torch.sqrt(model.b_c**2 + model.b_s**2))
    


        #print(model.z)
        #print(model.a_c)
        #print(model.b_c)
        #print(model.a_s)
        #print(model.b_s
    

    loss.backward()

    optimizer.step()

    if step % 1000 == 0:
        print(step, loss.item())
        #plt.plot(x.cpu().detach().numpy())
        y = model.forward(torch.linspace(0, len(x) * 3, len(x) * 3, device=device))
        #plt.plot(y.cpu().detach().numpy())
        #plt.show()

        res = y.cpu().detach().numpy()

        wavfile.write(f"/tmp/res{step}.wav", fs, res)    

    
        









