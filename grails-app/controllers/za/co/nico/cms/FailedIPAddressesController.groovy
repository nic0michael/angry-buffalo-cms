package za.co.nico.cms
import java.util.concurrent.TimeUnit


class FailedIPAddressesController {

    def scaffold = true
//    def index() { }
    public  void updateNumberOfFailedAttempts(String ipAddress){

        FailedIPAddresses failedIPAddresses=FailedIPAddresses.findByIpAddress(ipAddress)
        if(failedIPAddresses!=null) {
            int nrFailedAttempts = failedIPAddresses.nrFailedAttempts
            int difference =   (new Date().time - failedIPAddresses.getDate().time)/1000
            println("difference: "+difference)
            if (difference>180){
                difference=0;
                nrFailedAttempts=0
            }
            failedIPAddresses.setNrFailedAttempts(nrFailedAttempts + 1)
            failedIPAddresses.setDate(new Date())
            failedIPAddresses.setNrSecondsSinceLastLogon(difference)
            failedIPAddresses.save(flush: true)
        } else{
            failedIPAddresses =new FailedIPAddresses()
            failedIPAddresses.setNrFailedAttempts(1)
            failedIPAddresses.setIpAddress(ipAddress)
            failedIPAddresses.setDate(new Date())
            failedIPAddresses.setNrSecondsSinceLastLogon(-1)
            failedIPAddresses.save(flush: true)
            println("difference: NOT_SET")
        }
    }


    public  void resetNumberOfFailedAttempts(String ipAddress){
        FailedIPAddresses failedIPAddresses=FailedIPAddresses.findByIpAddress(ipAddress)
        if(failedIPAddresses!=null) {
            failedIPAddresses.setNrFailedAttempts(0)
            failedIPAddresses.setDate(new Date())
            failedIPAddresses.setNrSecondsSinceLastLogon(1000)
            failedIPAddresses.save(flush: true)
            println("NrFailedAttempts: NOW_RESET")
        }
    }

    public  int getNrFailedAttempts(String ipAddress){
        FailedIPAddresses failedIPAddresses= FailedIPAddresses.findByIpAddress(ipAddress)
        try {
            if(failedIPAddresses==null){
                return 0
            }
            println("nrFailedAttempts ->"+failedIPAddresses.nrFailedAttempts)
            return failedIPAddresses.nrFailedAttempts
        } catch (Exception e) {
            return 0
        }
    }

    public  int getNrSecondsSinceLastLogon(String ipAddress){
        FailedIPAddresses failedIPAddresses=FailedIPAddresses.findByIpAddress(ipAddress)
        try {
            if(failedIPAddresses!=null) {
                int nrFailedAttempts = failedIPAddresses.nrFailedAttempts
                int difference =   (new Date().time - failedIPAddresses.getDate().time)/1000
                if(difference>180){
                    println("nrSecondsSinceLastLogon =>"+difference)
                    return difference;
                }
                println("nrSecondsSinceLastLogon ->"+failedIPAddresses.getNrSecondsSinceLastLogon)
                return failedIPAddresses.getNrSecondsSinceLastLogon()
            }
        } catch (Exception e) {
        }
        return 1000;
    }

}
