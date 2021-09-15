drugs <- drug_list(key="WaPo")
drugs                

oxycodone <- drug_county_biz(drug = "OXYCODONE", county = "Fayette", state = "KY", key = "WaPo")

# how big is this file

nrow(oxycodone)

#what type of buyers?

oxycodone %>%
  select(BUYER_DEA_NO, BUYER_BUS_ACT) %>%
  unique() %>%
  count(BUYER_BUS_ACT)

# clean up and consolidate the categories

oxycodone <- oxycodone %>%
  mutate(type=case_when(
    grepl("PHARMACY", BUYER_BUS_ACT) ~ "PHARMACY",
    grepl("DETOX", BUYER_BUS_ACT) ~ "DETOX/MAINTENANCE",
    grepl("MAINT", BUYER_BUS_ACT) ~ "DETOX/MAINTENANCE",
    grepl("-VA", BUYER_BUS_ACT) ~ "VA",
    grepl("CLINIC", BUYER_BUS_ACT) ~ "CLINIC",
    TRUE ~ BUYER_BUS_ACT
  ))

# totals
oxycodone_summary <- oxycodone %>%
#focus only on purchase orders, which is transaction code S
  filter(TRANSACTION_CODE=="S") %>%
group_by(type) %>%  
#calculate amount
  mutate(amount=CALC_BASE_WT_IN_GM*MME_Conversion_Factor) %>%
  summarize(total=sum(amount, na.rm=T)) %>%
arrange(desc(total))

# chart it

ggplot(oxycodone_summary, aes(x=total, y=type)) +
  geom_col() +
  scale_x_continuous(label=comma) +
  theme_minimal() +
  labs(title="Fayette County Oxycodone dosages ordered by buyer type")

