# 练习2-2
# 1.生成1到15之间所有偶数
seq(from = 2, to = 15,by = 2)
# 2.生成向量，内容为："student2"  "student4"  "student6"  "student8"  "student10" "student12"
# "student14" 
paste0(rep("student", times = 7),seq(from = 2, to = 15,by = 2) )
# 提示：paste0
# 3.将两种不同类型的数据用c()组合在一起，看输出结果
c("1", "a")
# 练习2-4
# 说明：运行load("gands.Rdata"),即可得到和使用我准备的向量g和s，
# 如有报错，说明你的代码写错或project没有正确打开
load("R_01/gands.Rdata")

# 1.用函数计算向量g的长度

# 2.筛选出向量g中下标为偶数的基因名。
# 3.向量g中有多少个元素在向量s中存在(要求用函数计算出具体个数)？将这些元素筛选出来
# 提示：%in%
# 4.生成10个随机数: rnorm(n=10,mean=0,sd=18)，用向量取子集的方法，取出其中小于-2的值
