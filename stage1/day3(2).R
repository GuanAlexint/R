#鸢尾花实例
data(iris)  # 加载数据集
head(iris)  # 查看前6行数据
summary(iris)  # R中查看统计摘要
#可视化
#箱线图：比较不同品种的花瓣宽度分布
library(ggplot2)
ggplot(iris, aes(x=Species, y=Petal.Width, fill=Species)) + 
  geom_boxplot()
#回归分析
#预测花瓣长度与其他特征的关系
model <- lm(Petal.Length ~ Sepal.Length + Sepal.Width, data=iris)
summary(model)

#筛选数据 filter
library(dplyr)
long_petals <- iris %>% 
  filter(Petal.Length > 5)  # 筛选花瓣长度>5cm的样本
print(long_petals)  # 输出：仅包含Versicolor和Virginica品种的样本（Setosa花瓣长度均<2cm）

#选择列 select
petal_data <- iris %>% 
  select(Species, Petal.Length, Petal.Width)
head(petal_data)  # 仅保留物种和花瓣相关列

#分组统计 group_by + summarise
species_summary <- iris %>% 
  group_by(Species) %>% 
  summarise(
    mean_petal_length = mean(Petal.Length),
    sd_petal_length = sd(Petal.Length)
  )
print(species_summary)  # 计算各品种花瓣长度的均值与标准差

#数据排序 arrange  
sorted_iris <- iris %>% 
  arrange(desc(Petal.Width))  # 降序排列
head(sorted_iris)  # 按花瓣宽度降序排序

# 查看Petal.Width的最大值及对应行
iris[which.max(iris$Petal.Width), ]

#箱线图（按物种分组）
library(ggplot2)
iris %>% 
  ggplot(aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Petal Length by Species", x = "Species", y = "Petal Length (cm)")
#Virginica的花瓣长度中位数最高，Setosa最低

#散点图（花瓣长度 vs 花瓣宽度）
iris %>% 
  ggplot(aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point() +
  labs(title = "Petal Length vs Width", x = "Petal Length (cm)", y = "Petal Width (cm)")
#不同物种在花瓣尺寸上形成明显聚类

#完整演示
# 1. 数据导入与预处理
data(iris)
clean_iris <- iris %>% 
  filter(!is.na(Petal.Length))  # 删除缺失值（本数据集无缺失，仅为示例）

# 2. 按物种分组统计
stats <- clean_iris %>% 
  group_by(Species) %>% 
  summarise(
    Count = n(),
    Avg_Sepal_Length = mean(Sepal.Length),
    Max_Petal_Width = max(Petal.Width)
  )

# 3. 筛选并排序
virginica_data <- clean_iris %>% 
  filter(Species == "virginica") %>% 
  arrange(desc(Sepal.Width))

# 4. 导出结果
write.csv(stats, "iris_summary.csv", row.names = FALSE)