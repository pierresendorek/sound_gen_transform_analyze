
## Finding the resonnant frequencies

Assume we woule like a filter with an spectrum whose shape is


$$\frac{1}{1 +  \left(\frac{x}{a}\right)^{2n}}$$

To see how to express it with simple filters, we want to factorize this. Let's find the roots of

$$(x/a)^{N} + 1 = 0$$

where $N = 2n$.


Let's check if the following candidates, for $k=1,...,N$, can be a solution

$$x_k = a \exp\left(\frac{-i \pi}{N}\right) \exp\left( \frac{i 2k \pi}{N} \right)$$




When looking at the $N^{th}$ power we indeed have
$$ 
x_k^{N} = a^N \exp\left(\frac{ -i \pi}{1}\right) \exp\left( \frac{i 2k \pi}{1} \right) = -a^N
$$
which is a solution. We thus have all the $N$ different solutions with $k=1...N$.

Thus

$$1 + \left(\frac{x}{a}\right)^{N} = \prod_{k=1...N} \frac{x - x_k}{a}$$
$$ = \frac{1}{a^N} \prod_{k=1...N}  x - x_k$$

We can simulate a discrete version of this filter with the same resonnant frequencies.


The filter can be expressed as

$$a^N\prod_{k=1...N} \frac{1}{1 - z^{-1}x^k}$$

if $|a| < 1$.


## Cutoff frequency
