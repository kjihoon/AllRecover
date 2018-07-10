

df<-read.csv("병원정보3.csv")
ykiho<-df[,2]



url<-"http://apis.data.go.kr/B551182/hospAsmRstInfoService/getHospWhlAsmRstList?ServiceKey=BVnt6h5rMtX52Vuu5ckoGKesnewYmnOTSYLd6GaQ4vjGnBMCgCG%2FEoMuP5StXjfQQZmrLeNU1luHjqbDDbu4cg%3D%3D&ykiho="

df<-rbind(name)
for(j in 3848:length(ykiho)){
  urlf<-paste0(url,ykiho[j])
  html<-read_html(urlf)
  nodes<-html_nodes(html,"item")
  a<-c()
  for (i in name){
    b<-html_node(nodes,i)
    c<-html_text(b)
    if (length(c)==0||is.na(c)){
      c<-"null"
    }
    a<-c(a,c)
  }
  df<-rbind(df,a)
  if (j%%50==0){
    print(j)
  }
}


