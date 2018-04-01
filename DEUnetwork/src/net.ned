//simdilik ana network olarak bunu kullanacağız, ortam karısınca parcalarız
network Network
{
    parameters:
        
        int n_pc = default(5);//olusturulacak bilgisayar sayısı(burada default verildi asıl sayı simulations/omnetpp.ini altında **.n_pc komutunda yer alıyor)
       
    submodules:

        switch: Switch{
        @display("i=block/switch,gold");
        };
        computer[n_pc]: Computer;
   
     connections:
         //baglantılar
        for i=0..n_pc-1 {
            computer[i].out --> switch.in++;
            switch.out++ --> computer[i].in;
        }
}

