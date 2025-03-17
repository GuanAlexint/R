#数据框
# 创建数据框示例
patients <- data.frame(
  ID = 1:5,
  Age = c(55, 67, 72, 61, 68),
  Diagnosis = c("AD", "Control", "AD", "Control", "AD")
)
#查看数据
head(patients)
str(patients)
#提取列
patients$Age
patients[,"Age"]

#条件筛选
# 筛选年龄大于60的AD患者
ad_older <- patients[patients$Age > 60 & patients$Diagnosis == "AD", ]
print(ad_older)

library(dplyr)
patients %>%
  filter(Diagnosis == "AD") %>%  # 筛选AD患者
  summarise(mean_age = mean(Age))  # 计算AD组平均年龄

library(dplyr)
patients_with_gender <- patients %>%
  mutate(Gender = c("F", "M", "F", "M", "F"))  # 添加Gender列

result <- patients_with_gender %>%
  group_by(Diagnosis) %>%  # 按哪一列分组？
  summarise(max_age = max(Age))  # 计算最大值

print(result)