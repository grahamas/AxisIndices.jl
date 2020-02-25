
@testset "Array Interface" begin
    x = AxisIndicesArray([1 2; 3 4])
    @test AxisIndices.parent_type(typeof(x)) == AxisIndices.parent_type(x) == Array{Int,2}
    @test size(x) == (2, 2)
    @test parentindices(x) == parentindices(parent(x))

    @test x[CartesianIndex(2,2)] == 4
    x[CartesianIndex(2,2)] = 5
    @test x[CartesianIndex(2,2)] == 5

    @test keys.(axes(similar(x, (2:3, 4:5)))) == (2:3, 4:5)
    @test eltype(similar(x, Float64, (2:3, 4:5))) <: Float64
    @test_throws ErrorException AxisIndicesArray(rand(2,2), (2:9,2:1))
end