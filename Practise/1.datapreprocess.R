#data preprocess
library(Seurat)
library(data.table)
library(stringr)
library(tibble)
library(Seurat)
library(GEOquery)

#### 以 GSE72056 为例
gse <- getGEO("GSE72056", GSEMatrix = TRUE)
expr <- exprs(gse[[1]])

setwd("C:/Users/xx/Documents/GitHub/R_learning/Practise")
epxpr <- fread(input = "GSE72056_melanoma_single_cell_revised_v2.txt")
# 构建 Seurat 对象
pbmc <- CreateSeuratObject(counts = expr, project = "GSE72056", min.cells = 3,
                           min.features = 2000)

# QC
pbmc[["percent.mt"]] <- PercentageFeatureSet(pbmc, pattern = "^MT-")
pbmc <- subset(pbmc, subset = nFeature_RNA > 200 & percent.mt < 5)

# 标准流程
pbmc <- NormalizeData(pbmc)
pbmc <- FindVariableFeatures(pbmc)
pbmc <- ScaleData(pbmc)
pbmc <- RunPCA(pbmc)
pbmc <- RunUMAP(pbmc, dims = 1:10)
pbmc <- FindNeighbors(pbmc, dims = 1:10)
pbmc <- FindClusters(pbmc, resolution = 0.5)

# marker基因
FeaturePlot(pbmc, features = c("CD3D","CD8A","PDCD1","FOXP3"))
