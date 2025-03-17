#操作符$%
# 创建数据框
df <- data.frame(
  gene = c("APOE", "PSEN1", "APP"),
  p_value = c(0.01, 0.05, 0.001)
)
# 使用$提取列
df$gene      # 输出：APOE, PSEN1, APP
df$p_value   # 输出：0.01, 0.05, 0.001
# 创建列表
my_list <- list(name = "Alzheimer", samples = 100)
my_list$name   # 输出："Alzheimer"

library(dplyr)  # dplyr会自动加载管道符%>%

# 传统嵌套写法
mean(c(1, 2, 3, NA), na.rm = TRUE)  # 输出：2

# 使用管道符的链式写法
c(1, 2, 3, NA) %>% 
  mean(na.rm = TRUE)  # 输出：2

#管道操作符 %>%
# 数据框操作示例
df %>% 
  filter(p_value < 0.05) %>%  # 筛选p_value < 0.05的行
  select(gene)                # 提取gene列

#成员判断符 %in%
genes <- c("APOE", "PSEN1", "APP")
"APOE" %in% genes  # 输出：TRUE
"TP53" %in% genes  # 输出：FALSE

#取余运算符 %%
10 %% 3  # 输出：1（10除以3的余数）

#多条件筛选
df %>% 
  filter(p_value < 0.05 & gene != "APP") %>%  # 筛选p<0.05且gene非APP
  select(gene)

#应用
df %>% 
  filter(p_value < 0.05) %>% 
  select(gene) %>% 
  arrange(gene)  # 按gene字母升序排序
significant_genes <- df %>% 
  filter(p_value < 0.05) %>% 
  select(gene)   # 存结果到新变量
df %>% 
  filter(p_value < 0.05) %>% 
  select(gene) %>% 
  write.csv("significant_genes.csv", row.names = FALSE)  # 导出结果到CSV
