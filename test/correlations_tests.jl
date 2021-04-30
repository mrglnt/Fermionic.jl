using Fermionic
using SparseArrays
using Test

@testset "Fermionic.jl" begin
    @test ssp(State_sparse(spzeros(16), Op(4))) == 0
    @test ssp(State([0,0,0,1/sqrt(2),0,0,0,0,0,0,0,0,1/sqrt(2),0,0,0],Op(4))) == 1.0
    @test ssp(State([0,0,0,im/sqrt(2),0,0,0,0,0,0,0,0,1/sqrt(2),0,0,0],Op(4))) == 1.0
    @test ssp(State_sparse(1/sqrt(2)*(im*cdm(Op(4),1)*cdm(Op(4),2)+cdm(Op(4),3)*cdm(Op(4),4))*vacuum(Op(4)),Op(4))) == 1.0
    @test ssp(State_fixed(1/sqrt(2)*[1,0,0,0,0,1],Op(4),2)) == 1.0
    @test ssp(State_fixed(1/sqrt(2)*[1,0,0,0,0,im],Op(4),2)) == 1.0
    @test ssp(State_fixed(1/sqrt(2)*[1,0,0,0,0,1],Op(4),2)) == 1.0
    @test ssp(State_sparse_fixed(spzeros(6),Op(4),2)) == 0
    @test ssp(State_sparse_fixed(SparseVector(sparse([1,6],[1,1],[1/sqrt(2),im/sqrt(2)])),Op(4),2)) == 1.0
    @test sqsp(State_sparse(spzeros(16), Op(4))) == 0
    @test sqsp(State([0,0,0,1/sqrt(2),0,0,0,0,0,0,0,0,1/sqrt(2),0,0,0],Op(4))) == 1.0
    @test sqsp(State([0,0,0,im/2,0,0,0,0,0,0,0,0,sqrt(3)/2,0,0,0],Op(4))) == 0.8112781244591327
    @test sqsp(State_sparse(1/sqrt(2)*(im*cdm(Op(4),1)*cdm(Op(4),2)+cdm(Op(4),3)*cdm(Op(4),4))*vacuum(Op(4)),Op(4))) == 1
    @test majorization_sp(State([0,0,0,im/2,0,0,0,0,0,0,0,0,sqrt(3)/2,0,0,0],Op(4)),State([0,0,0,im/2,0,0,0,0,0,0,0,0,sqrt(3)/2,0,0,0],Op(4))) == 0
    @test majorization_qsp(State([0,0,0,im/2,0,0,0,0,0,0,0,0,sqrt(3)/2,0,0,0],Op(4)),State([0,0,0,im/sqrt(2),0,0,0,0,0,0,0,0,1/sqrt(2),0,0,0],Op(4))) == 1
    @test n_avg(State_sparse(1/sqrt(2)*(im*cdm(Op(4),1)*cdm(Op(4),2)+cdm(Op(4),3)*cdm(Op(4),4))*vacuum(Op(4)),Op(4))) == 2.0
    @test rhom(State_sparse(1/sqrt(2)*(cdm(Op(6),1)*cdm(Op(6),2)*cdm(Op(6),3)*cdm(Op(6),4)+cdm(Op(6),3)*cdm(Op(6),4)*cdm(Op(6),5)*cdm(Op(6),6))*vacuum(Op(6)),Op(6)),2)[3,3] == 0.5
    @test rhom(State_sparse(1/sqrt(2)*(im*cdm(Op(6),1)*cdm(Op(6),2)*cdm(Op(6),3)*cdm(Op(6),4)+cdm(Op(6),3)*cdm(Op(6),4)*cdm(Op(6),5)*cdm(Op(6),6))*vacuum(Op(6)),Op(6)),2)[3,3] == 0.5
    @test rhom(State_sparse_fixed(fixed_state(1/sqrt(2)*(cdm(Op(6),1)*cdm(Op(6),2)*cdm(Op(6),3)*cdm(Op(6),4)+cdm(Op(6),3)*cdm(Op(6),4)*cdm(Op(6),5)*cdm(Op(6),6))*vacuum(Op(6)),4),Op(6),4),2)[6,6] == 0.5
    @test rhom(State_sparse_fixed(fixed_state(1/sqrt(2)*(im*cdm(Op(6),1)*cdm(Op(6),2)*cdm(Op(6),3)*cdm(Op(6),4)+cdm(Op(6),3)*cdm(Op(6),4)*cdm(Op(6),5)*cdm(Op(6),6))*vacuum(Op(6)),4),Op(6),4),2)[1,1] == 1.0
    @test rhomnd(State_sparse(1/sqrt(2)*(cdm(Op(6),1)*cdm(Op(6),2)*cdm(Op(6),3)*cdm(Op(6),4)+cdm(Op(6),3)*cdm(Op(6),4)*cdm(Op(6),5)*cdm(Op(6),6))*vacuum(Op(6)),Op(6)),2)[15,1] == 0.5
    @test rhomnd(State_sparse(1/sqrt(2)*(im*cdm(Op(6),1)*cdm(Op(6),2)*cdm(Op(6),3)*cdm(Op(6),4)+cdm(Op(6),3)*cdm(Op(6),4)*cdm(Op(6),5)*cdm(Op(6),6))*vacuum(Op(6)),Op(6)),2)[4,4] == 0.5
    @test trp(State_sparse(spzeros(16), Op(4)),[1])[1,1] == 0
    @test round(trp(State([0,0,0,1/sqrt(2),0,0,0,0,0,0,0,0,1/sqrt(2),0,0,0],Op(4)),[2,4])[2,2],digits=5) == 0.5
    @test round(trp(State([0,0,0,im/sqrt(2),0,0,0,0,0,0,0,0,1/sqrt(2),0,0,0],Op(4)),[1,4])[2,2],digits=5) == 0.5
    @test round(trp(State_sparse(1/sqrt(2)*(im*cdm(Op(4),1)*cdm(Op(4),2)+cdm(Op(4),3)*cdm(Op(4),4))*vacuum(Op(4)),Op(4)),[2,3])[2,2],digits=5) == 0.5
end
