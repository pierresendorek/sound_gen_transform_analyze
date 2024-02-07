
We want to factorize this, where $a > 0$
$$\frac{1}{1 +  \left(\frac{z}{a}\right)^{2n}}$$

Let's find the roots of

$$(z/a)^{N} + 1 = 0$$

where $N = 2n$.


Let's check if the following candidates, for $k=1,...,N$, can be a solution

$$z_k = a \exp\left(\frac{-i \pi}{N}\right) \exp\left( \frac{i 2k \pi}{N} \right)$$




When looking at the $N^{th}$ power we indeed have
$$ 
z_k^{N} = a^N \exp\left(\frac{ -i \pi}{1}\right) \exp\left( \frac{i 2k \pi}{1} \right) = -a^N
$$
which is a solution. We thus have all the $N$ different solutions with $k=1...N$.

Thus

$$1 + \left(\frac{z}{a}\right)^{N} = \prod_{k=1...N} \frac{z - z_k}{a}$$
$$ = \frac{1}{a^N} \prod_{k=1...N}  z - z_k$$


