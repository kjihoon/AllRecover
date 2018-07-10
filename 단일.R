

df<-read.csv("병원정보3.csv")
ykiho<-df[,2]
ykiho<-as.character(ykiho)


url<-"http://apis.data.go.kr/B551182/hospAsmRstInfoService/getHospWhlAsmRstList?ServiceKey=BVnt6h5rMtX52Vuu5ckoGKesnewYmnOTSYLd6GaQ4vjGnBMCgCG%2FEoMuP5StXjfQQZmrLeNU1luHjqbDDbu4cg%3D%3D&ykiho="

df<-rbind(name)
list<-c()
for(j in 1:length(ykiho)){
  urlf<-paste0(url,ykiho[j])
  html<-read_html(urlf)
  nodes<-html_nodes(html,"item")
  list<-append(list,nodes)
  if (j%%100==0){
    print(j)
  }
}

