"""
function loadcoil20(;every=1)

    Load 20 × 72 images from the COIL-20 image library.
    
    These data have been taken from: https://www.cs.columbia.edu/CAVE/software/softlib/coil-20.php
    Should you use these data, please cite the following paper as requested by the original authors of the data:

    Columbia Object Image Library (COIL-20), S. A. Nene, S. K. Nayar and H. Murase, Technical Report CUCS-005-96, February 1996.

    Example: use function loadcoil20(;every=2) to subsamble images to 64×64.
    Example: use function loadcoil20(;every=8) to subsamble images to 16×16.
"""    
function loadcoil20(;every=1)

    X = JLD2.load(joinpath(artifact"coil20data", "coil-20.jld2"))["X"]

    [reduce(hcat, [vec(x[1:every:end,1:every:end]) for x in Xᵢ]) for Xᵢ in X]

end