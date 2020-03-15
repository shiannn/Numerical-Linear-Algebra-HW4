### Inverse iteration
1.  inverse power method是一種iterative eigenvalue algorithm。
    -   如果已經知道eigenvalue的近似，我們可以用此法來得到eigenvector。

2.  運作
    -   以欲得到的特徵向量的特徵值近似 m 和 b0(random或是近似)來做起始

    -   b_{k+1} = (A-mI)^(-1)b_k / CK
        -   Ck就是分子的長度，意即作normalization
        -   但是特徵向量是可以伸縮的。所以任何常數都應當可以

    -   選擇愈好的特徵值作為起始，收斂愈快