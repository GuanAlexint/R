x <- 5       # 数值型变量
gene <- "APOE"  # 字符型变量（必须加引号）
is_AD <- TRUE   # 逻辑型变量（TRUE/FALSE）

age <- c(55, 60, 72, 68)      # 数值向量
genes <- c("APOE", "APP")      # 字符向量
#向量vector：存储多个相同类型的值

#算术运算
x <- 10
y <- 3
x + y   # 13
x / y   # 3.333...
x^2     # 100

#向量化操作
heights <- c(160, 175, 182, 155)
heights * 0.01   # 转换为米：1.60, 1.75, 1.82, 1.55

#逻辑运算
age <- c(55, 60, 72, 68)
age > 65  # 输出：FALSE FALSE TRUE TRUE

#常见函数
mean(age)    # 均值
sd(age)      # 标准差
sum(age)     # 求和
length(age)  # 向量长度
sort(age)    # 排序
unique(genes) # 去重

patient_ages <- c(55, 60, 72, 68)  # 创建年龄向量
mean_age <- mean(patient_ages)      # 计算平均年龄
print(mean_age)                     # 输出结果：63.75


# 1. 创建一个包含5个学生分数的向量（数值型）
scores <- c(85, 92, 78, 88, 65)

# 2. 计算平均分
average_score <- mean(scores)  # 在横线处填入正确的函数

# 3. 筛选出及格的学生（分数≥60）
pass_students <- scores[scores>=60]  # 在横线处填入逻辑条件

# 4. 输出结果
print(paste("平均分：", average_score))
print("及格的学生分数：")
print(pass_students)