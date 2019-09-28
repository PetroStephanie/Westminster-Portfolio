'''
ResidencyMatch.py

This algorithm operates by reading an input file of the form

[residents | hospitals] preference 1, preference 2, preference 3, preference 4, ...

Any whitespace occurring in the input files is stripped off.

Usage:

    python ResidencyMatch.py [residents preference file] [hospitals preference file]

Stephanie Petrosyants
Katherine Sublette
'''

import sys
import csv
import json
import msvcrt as m
class ResidencyMatch:

    # behaves like a constructor
    def __init__(self):
        '''
        Think of
        
            unmatchedHospitals
            residentsMappings
            hospitalsMappings
            matches
            
        as being instance data for your class.
        
        Whenever you want to refer to instance data, you must
        prepend it with 'self.<instance data>'
        '''
        
        # list of unmatched hospitals
        self.unmatchedHospitals = [ ]
        
        # dictionaries representing preferences mappings
        
        self.residentsMappings = { }
        self.hospitalsMappings = { }
        
        # dictionary of matches where mapping is resident:hospital
        self.matches = { }
        
        # read in the preference files
        
        '''
        This constructs a dictionary mapping a resident to a list of hospitals in order of preference
        '''
        
        prefsReader = csv.reader(open (sys.argv[1],'r'), delimiter = ',')
        for row in prefsReader:
            # maps a resident to a list of preferences
            resident = row[0].strip()
            self.residentsMappings[resident] = [x.strip() for x in row[1:]]
            
            # initially have each resident as unmatched
            self.matches[resident] = None
        
        '''
        This constructs a dictionary mapping a hospital to a list of residents in order of preference
        '''
        
        prefsReader = csv.reader(open (sys.argv[2],'r'), delimiter = ',')
        for row in prefsReader:
            
            hospital = row[0].strip()
            
            # all hospitals are initially unmatched
            self.unmatchedHospitals.append(hospital)
            
            # maps a resident to a list of preferences
            self.hospitalsMappings[hospital] = [x.strip() for x in row[1:]] 
    
            
    def reportMatches(self):
        for resident in self.matches:
            print(resident + ":" + self.matches[resident])
            
    def runMatch(self):
        '''
        It is suggested you use the debugger or similar output statements
        to determine what the contents of the data structures are

        connect first resident with their pref hospital
        '''
        firstHospital = next(iter(self.unmatchedHospitals))
        firstResident = (self.hospitalsMappings[firstHospital])[0]
        
        self.matches[firstResident] = firstHospital
        self.unmatchedHospitals.remove(firstHospital)

        while self.unmatchedHospitals:

            currentHospital = self.unmatchedHospitals[0] 
            '''
            hospital makes offer to resident of highest priority
            '''
            # try to find prefered resident for current hospital
            for prefResident in self.hospitalsMappings[currentHospital]:
                '''
                check this res availability 
                if they are not available
                    compare priorities 
                    if they are
                    say yes and match them
                '''
                # the resident already has a match
                if self.matches[prefResident]:
                    # try to re-assign them
                    got_matched = self.check_for_reassignment(prefResident, currentHospital)
                    if got_matched:
                        break
                else:
                    '''
                    match them
                    '''  
                    # print("matching pref resident to current hospital "+ prefResident + " : " + currentHospital)
                    self.matches[prefResident] = currentHospital
                    self.unmatchedHospitals.remove(currentHospital)
                    break

                      
    def check_for_reassignment(self, resident, currentHospital):
        '''
        compare the hospitals priority with the residents priority 
            if the hospital's priority is high
                the resident accepts the hospital and the previous
                hospital becomes available
            if the hospitals's priority is low
                the resident rejects the hospital
        '''

        # {"Alex": null, "Barbara": "VT", "Charlie": "NY", "Doris": "WA"}
        # current hospital = CA
        resCurrentHospital = self.matches[resident]
        residentsPref = self.residentsMappings[resident]

        # currentHospital = WA
        for prefHospital in residentsPref:
            if prefHospital == resCurrentHospital:
                return False    
            if prefHospital == currentHospital:
                self.unmatchedHospitals.append(resCurrentHospital)
                self.matches[resident] = currentHospital
                self.unmatchedHospitals.remove(currentHospital)
                # print('current match set: ' + json.dumps(self.matches))
                return True
            


        
if __name__ == "__main__":
    
    # some error checking
    if len(sys.argv) != 3:
        print('ERROR: Usage\n python ResidencyMatch.py [residents preferences] [hospitals preferences]')
        quit()
   
    # create an instance of ResidencyMatch 
    match = ResidencyMatch()

    # now call the runMatch() function
    match.runMatch()

    # report the matches
    match.reportMatches()