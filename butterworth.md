
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

And since 

$$ 2 i \pi  \int_{0}^{\infty} e^{-b_kt} e^{-2i\pi t x}dt =  \frac{1}{x + b_k  (2 i \pi)^{-1}}$$

if we set

$-x_k = b_k(2 i \pi)^{-1}$ or equivalently $- 2 i \pi x_k = b_k$

it means that

$$a^N \prod_{k=1...N} \frac{1}{x - x_k}$$

Is the fourier transform of

$(g_1 \ast g_2 \ast \ldots \ast g_N)(t)$

where

$$g_k(t) = 2 i \pi e^{-b_k t} = 2 i  \pi e^{2 i \pi x_k t} $$


## Discrete simulation

We can simulate a discrete version of this filter with the similar resonnant frequencies.


The filter can be expressed as

Let $z_k = \exp(2 i \pi x_k)$ if $\mathcal{Re}(x_k) > 0$

$$a^N\prod_{k=1...N} \frac{1}{1 - z^{-1}z_k}$$

if $|z_k| < 1$.

$z_k = \exp(2 i \pi x_k)$ where $x_k$ is the normalized frequency.

However the series expansion leads to divergent terms

# https://dsp.stackexchange.com/questions/26114/how-to-stabilize-a-filter

if $|z_k| > 1$ we use the fact that if we replace $z$ by $e^{2 i \pi f}$ we have

$$\frac{1}{1 - az^{-1}} = \frac{1}{1 - r e^{2i\pi (f_0 - f)}}$$

$$= - \frac{r^{-1}}{1 - r^{-1} e^{2i\pi (f - f_0)} }$$

which means that we want a resonnance at $-f_0$ with an exponential amplitude of $r^{-1}$ and mutliplied by a coeffiient -1.



## Cutoff frequency


$$\frac{1}{1 +  \left(\frac{x}{a}\right)^{2n}} = \frac{1}{2}$$

if 
$$1 +  \left(\frac{x}{a}\right)^{2n} = 2$$
$$ \left(\frac{x}{a}\right)^{2n} = 1$$
$$ x=a$$
