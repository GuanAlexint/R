#数据框定义
#允许不同列存储不同数据类型（数值、字符、逻辑等），但每列内部数据类型必须统一

#创建
#从向量创建
df <- data.frame(
  gene = c("APOE", "PSEN1", "APP"), 
  change = c("up", "down", "up"),
  score = c(1.2, -0.8, 0.5)
)
#从矩阵转换
mat <- matrix(1:9, nrow=3)
df <- as.data.frame(mat)
#读取外部文件
df <- read.csv("data.csv")  # CSV文件
df <- read.xlsx("data.xlsx")  # Excel文件（需openxlsx包）

#数据框属性操作
#查看维度
dim(df)  #行列数
nrow(df) #行数
ncol(df) #列数
#修改列名
colnames(df)[2] <- "CHANGE"  # 修改第二列名
colnames(df) <- c("Gene", "Expression", "Pvalue")  # 全列重命名

#数据框取子集
#按坐标/列名提取
df[2, 3]          # 第二行第三列
df[, "score"]     # 提取score列
df[c(1,3), 1:2]   # 第1、3行的前两列
#按逻辑条件筛选
df[df$score > 0, ]           # 筛选score>0的行
subset(df, change == "up")   # 等价筛选

#数据处理
#新增列
df$log2FC <- log2(df$score + 1)  # 计算log2转换列
#删除列/行
df <- df[, -2]          # 删除第二列
df <- df[-3, ]          # 删除第三行
#修改数据
df$score[df$gene == "APOE"] <- 2.0  # 修改特定值

#数据分组与统计
library(dplyr)
df %>%
  group_by(change) %>%               # 按change列分组
  summarise(
    mean_score = mean(score),        # 计算均值
    max_score = max(score)           # 计算最大值
  )

#数据框连接
merge(df1, df2, by = "gene")              # 按共有列合并
bind_rows(df1, df2)                       # 纵向合并（行追加）
bind_cols(df1, df2)                       # 横向合并（列追加）

#长宽数据转换
#宽转长(gather)
library(tidyr)
df_long <- df %>% 
  gather(key = "variable", value = "value", -gene)
#长转宽(spread)
df_wide <- df_long %>% 
  spread(key = "variable", value = "value")

#数据框与列表互转
#列表转数据框
list_data <- list(gene = c("A", "B"), score = c(1, 2))
df <- as.data.frame(list_data)
#数据框转列表
list_df <- as.list(df)

#大数据处理：使用data.table包加速
library(data.table)
dt <- as.data.table(df)
dt[score > 0, mean(score), by = change]

#因子陷阱：字符列默认转为因子，需设置stringsAsFactors = FALSE
df <- data.frame(..., stringsAsFactors = FALSE)
#缺失值处理：用na.omit()删除含NA的行，或complete.cases()筛选完整行

data(iris)
# 1. 计算各物种花瓣长度均值
iris %>%
  group_by(Species) %>%
  summarise(mean_petal_length = mean(Petal.Length))

# 2. 筛选花瓣宽度>2的样本
iris_filtered <- iris[iris$Petal.Width > 2, ]

# 3. 可视化箱线图
library(ggplot2)
ggplot(iris, aes(x = Species, y = Sepal.Length)) + 
  geom_boxplot()



#数据框（Data Frame）基础：
#  创建数据框：data.frame()。
#  查看与修改数据框属性：dim(), colnames()。
#  提取子集：按坐标、列名或逻辑条件筛选。
#数据处理：
#  增删改列：df$new_col，df <- df[, -col]。mutate-day2
#  分组统计：dplyr::group_by() + summarise()。
#  数据框连接：merge(), bind_rows(), bind_cols()。
#长宽数据转换：
#  宽转长：tidyr::gather()。
#  长转宽：tidyr::spread()。
