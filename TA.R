#ANALISIS TIME SERIES - EXPONENTIAL SMOOTHING

#membuat variable untuk menampung dataset
Data = Data.Curah.Hujan

#mendefinisikan variable agar memiliki struktur bulanan dengan range waktu
Data = ts(Data, start=c(2017,1), end=c(2021,11), frequency = 12)

#plot dataset dalam bentuk grafik
ts.plot(Data)


#Single Exponential Smoothing
#inisialisasi
foreSingle = HoltWinters(Data, beta = F, gamma = F)

#melihat hasil
foreSingle

#mencari Sum Square Error (SSE)
foreSingle$SSE

#plot kedalam grafik
plot(foreSingle)


#Double Exponential Smoothing
#inisialisasi
foreDouble = HoltWinters(Data, gamma = F)

#melihat hasil
foreDouble

#mencari Sum Square Error (SSE)
foreDouble$SSE

#plot kedalam grafik
plot(foreDouble)


#Triple Exponential Smoothing
#inisialisasi 
foreTriple = HoltWinters(Data)

#melihat hasil
foreTriple

#mencari Sum Square Error (SSE)
foreTriple$SSE

#plot kedalam grafik
plot(foreTriple)


#plot SSE kedalam tabel
allSSE <- Data.frame(Metode=c("Single Exponential Smoothing",
                              "Double Exponential Smoothing Holt",
                              "Triple Exponential Smoothing Holt-Winters"),
                     SSE=c(foreSingle$SSE,
                           foreDouble$SSE,
                           foreTriple$SSE))

#melihat tabel SSE
View(allSSE)

#prediksi menggunakan Triple Exponential Smoothing untuk 5 bulan kedepan
predict(foreTriple, n.ahead = 5)
