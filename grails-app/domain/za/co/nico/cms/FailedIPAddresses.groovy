package za.co.nico.cms

class FailedIPAddresses {
    String ipAddress
    int nrFailedAttempts
    Date date
    int nrSecondsSinceLastLogon

    static constraints = {
    }
}
