
## Finding the resonnant frequencies

Assume we would like a filter with a spectrum whose shape is


$$\frac{1}{1 +  \left(\frac{x}{a}\right)^{2n}}$$

To see how to express it with simple filters, we want to factorize this. Let's find the roots of

$$(x/a)^{N} + 1 = 0$$

where $N = 2n$.


Let's check if the following candidates, for $k=1,...,N$ can be a solution

$$x_k = a \exp\left(\frac{-i \pi}{N}\right) \exp\left( \frac{i 2k \pi}{N} \right)$$




When looking at the $N^{th}$ power we indeed have
$$ 
x_k^{N} = a^N \exp\left(\frac{ -i \pi}{1}\right) \exp\left( \frac{i 2k \pi}{1} \right) = -a^N
$$
which is a solution. We thus have all the $N$ different solutions with $k=1...N$.

Thus

$$1 + \left(\frac{x}{a}\right)^{N} = \prod_{k=1...N} \frac{x - x_k}{a}$$
$$ = \frac{1}{a^N} \prod_{k=1...N}  x - x_k$$

It means that the continuous time filter has the following spectrum

$$\frac{1}{1 + (\frac{x}{a})^{N}} = a^N \prod_{k=1...N} \frac{1}{x - x_k}$$

And its Fourier transform is the multiple convolution product of

$$
t \mapsto \prod^*_{k=1...N} a \exp(- x_k t) \mathbb{I}(t > 0)
$$

<!-- See this part again -->
Indeed, since (when the real part of $y > 0$)
$$ \int_0^{\infty} \exp( -yt) \exp(-2 i \pi t) dt$$

$$ = \Big[\frac{\exp((-y - 2 i \pi) t)}{-y - 2 i \pi} \Big]_{t=0}^{t=\infty}$$

$$ = \frac{1}{y + 2 i \pi} $$

Now we solve
$$ \frac{C}{y + 2 i \pi}  = \frac{1}{x - x_k}$$
Which means

$$ C = - 2 i \pi / x_k $$

And
$$ y/C = x $$
$$ y = - 2 i \pi x / x_k $$


It means that
$$\frac{1}{x - x_k}$$

is the Fourier transform of

$$t \mapsto C \exp(-yt) = - \frac{2 i \pi}{x_k} \exp(2 i \pi t x / x_k) $$



## Discrete simulation

We can simulate a discrete version of this filter with the similar resonnant frequencies.


The filter can be expressed as

Let $z_k = \exp(2 i \pi x_k)$ if $\mathcal{Re}(x_k) > 0$

$$a^N\prod_{k=1...N} \frac{1}{1 - z^{-1}z_k}$$

if $|z_k| < 1$.

$z_k = \exp(2 i \pi x_k)$ where $x_k$ is the normalized frequency.

However the series expansion leads to divergent terms


if $|z_k| > 1$ we use [this stabilization method](https://dsp.stackexchange.com/questions/26114/how-to-stabilize-a-filter)

and instead of using

$$\frac{1}{1 - z_k z^{-1}}$$

we use

$$\frac{1}{|z_k|(1 - (z \bar{z}_k)^{-1})}$$

This way we keep the same resonnant frequency but we change the phase.

It may be desirable to keep the same phase for the 0 frequency, which amounts to multiplying by a constant $C$ which ensures that, by replacing $z = e^{2 i \pi 0} = 1$

$$\frac{1}{1 - z_k} = \frac{C }{|z_k|(1 - \bar{z}_k^{-1})}$$

This constant is the following and it lies on the unit circle

$$C = |z_k|\frac{1 - \bar{z}_k^{-1}}{(1 - z_k)} $$






## Cutoff frequency in continuous time


$$\frac{1}{1 +  \left(\frac{x}{a}\right)^{2n}} = \frac{1}{2}$$

if 
$$1 +  \left(\frac{x}{a}\right)^{2n} = 2$$
$$ \left(\frac{x}{a}\right)^{2n} = 1$$
$$ x=a$$
