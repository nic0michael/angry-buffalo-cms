package za.co.nico.cms

import java.util.Random

/**
 * Created with IntelliJ IDEA.
 * User: NMichael
 * Date: 2014/08/20
 * Time: 8:12 PM
 * To change this template use File | Settings | File Templates.
 */
class Utils {
    Random rand = new Random()
    def randomIntegerList = []

    public int randomNumber(int range){
        return rand.nextInt(range+1)
    }

    public void setRandomIntegerList(int range,int length){
        (1..length).each {
            randomIntegerList << randomNumber( range)
        }
        println(randomIntegerList)
    }
}
