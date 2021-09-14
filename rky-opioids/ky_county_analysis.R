kypop <- state_population(state = "KY", key = "WaPo")
mean(kypop$population)

kysummary <- summarized_county_annual (state = "KY", key = "WaPo")
mean(kysummary$DOSAGE_UNIT)


adair <- summarized_county_annual (state = "KY", county = "ADAIR", key = "WaPo")
adair
adair <- mean(adair$DOSAGE_UNIT)
adairpop <- county_population(state="KY", county="ADAIR", key="WaPo")
adairpop
adairpop <- mean(adairpop$population)
adairpop

adair <- adair / adairpop
adair # pills per person per year on average from 2006-2014


