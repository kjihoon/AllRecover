library(httr)
library(rvest)



name<-c("ykiho","yadmnm","clcd","clcdnm","sidocd","sidocdnm","sggucd","sggucdnm","emdongnm" ,"postno","addr","telno","hospurl","estbdd",
        "drtotcnt","gdrcnt","intncnt","resdntcnt" ,"sdrcnt" ,"xpos" ,"ypos" ,"distance")
name<-tolower(name)
df<-rbind(name)
url<-"http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?numOfRows=1000&ServiceKey=BVnt6h5rMtX52Vuu5ckoGKesnewYmnOTSYLd6GaQ4vjGnBMCgCG%2FEoMuP5StXjfQQZmrLeNU1luHjqbDDbu4cg%3D%3D&pageNo="

                



for (j in 1:100){
  pn<-j
  urlf<-paste0(url,pn)#final url
  html<-read_html(urlf)# html doc
  nodes<-html_nodes(html,"item")
  
  for (i in 1:1000){
    print(i)
    hospital<-c()
    for (j in 1:length(name)){
      hp<-nodes[i] %>% html_node(name[j]) %>% html_text()
      if (is.na(hp)){
        hp="empty"
      }
      hospital<-c(hospital,hp)
    }
    df<-rbind(df,hospital)
  }
  if (length(nodes)<1000){
    break;
  }
}



















