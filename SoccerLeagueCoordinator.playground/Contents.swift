// Treehouse iOS Techdegree
// Unit 1 - Project 1: Soccer League Coordinator in Swift
// By: Muhammad Moaz - www.muhammadmoaz.com

// - A Dictionary to hold all players names with Tuples to group associated values into a single compound value.
var players: [String: (height: Int, experience: Bool, guardians: String, team: String?)] = [
    "Joe Smith": (52, true, "Jim and Jan Smith", nil),
    "Jill Tanner": (36, true, "Clara Tanner", nil),
    "Bill Bon": (23, true, "Sara and Jenny Bon", nil),
    "Eva Gordon": (45, false, "Wendy and Mike Gordon", nil),
    "Matt Gill": (40, false, "Charles and Sylvia Gill", nil),
    "Kimmy Stein": (41, false, "Bill and Hillary Stein", nil),
    "Sammy Adams": (45, false, "Jeff Adams", nil),
    "Karl Saygan": (42, true, "Heather Bledsoe", nil),
    "Suzane Greenberg": (44, true, "Henrietta Dumas", nil),
    "Sal Dali": (41, false, "Gala Dali", nil),
    "Joe Kavalier": (39, false, "Sam and Elaine Kavaller", nil),
    "Ben Finkelstein": (44, false, "Aaron and Jill Finkeistein", nil),
    "Diego Soto": (46, true, "Robin and Sarika Soto", nil),
    "Chloe Alaska": (47, false, "David and Jamie Alaska", nil),
    "Arnold Willis": (43, false, "Claire Willis", nil),
    "Phillip Helm": (44, true, "Thomas and Eva Jones", nil),
    "Les Clay": (42, true, "Wynonna Brown", nil),
    "Herschel Krustofski": (45, true, "Hyman and Rachel Krustofski", nil)]

// - String helpers for better readability and code management.
let Dragons: String = "Dragons"
let Sharks: String = "Sharks"
let Raptors: String = "Raptors"

// - A Dictionary to hold teams, associated data and players. Again the use for a tuple for better data management. Players, array of type string, will hold player names associated with that team.
var teams: [String: (date: String, time: String, players: [String], height: Int)] = [Dragons: ("March 17", "1:00 PM", [], 0),
                                                                                     Sharks: ("March 17", "3:00 PM", [], 0),
                                                                                     Raptors: ("March 18", "1:00 PM", [], 0)]
// - Array to hold players depending on their experience
var experiencedPlayers: [String] = []
var inexperiencedPlayers: [String] = []

// - For loop to populate experience & inexperience player arrays
for (key, value) in players {
    if value.experience == true {
        experiencedPlayers.append(key)
    } else {
        inexperiencedPlayers.append(key)
    }
}

// - Function to determine number of players per team
func numberOfPlayersPerTeam(numberOfPlayers: Int, numberOfTeams: Int) -> Int {
    let playersPerTeam = numberOfPlayers / numberOfTeams
    return playersPerTeam
}

// - Constant Numbers to determine number of players per team as retured by function above.
let totalPlayersPerTeam = numberOfPlayersPerTeam(numberOfPlayers: players.count, numberOfTeams: teams.count)
let numberOfExperiencedPlayersPerTeam = numberOfPlayersPerTeam(numberOfPlayers: experiencedPlayers.count, numberOfTeams: teams.count)
let numberOfInexperiencedPlayersPerTeam = numberOfPlayersPerTeam(numberOfPlayers: inexperiencedPlayers.count, numberOfTeams: teams.count)

// - Loop to divide up Inxperienced players evenly
for key in experiencedPlayers {
    if (teams[Dragons]?.players.count)! < numberOfExperiencedPlayersPerTeam {
        teams[Dragons]?.players.append(key)
        players[key]?.team = Dragons
        teams[Dragons]?.height += (players[key]?.height)!
        
    } else if (teams[Sharks]?.players.count)! < numberOfExperiencedPlayersPerTeam {
        teams[Sharks]?.players.append(key)
        players[key]?.team = Sharks
        teams[Sharks]?.height += (players[key]?.height)!
        
    } else if (teams[Raptors]?.players.count)! < numberOfExperiencedPlayersPerTeam {
        teams[Raptors]?.players.append(key)
        players[key]?.team = Raptors
        teams[Raptors]?.height += (players[key]?.height)!
        
    } else {
        print("All teams filled with experienced players")
    }
}

// - Loop to divide up Inexperienced players evenly
for key in inexperiencedPlayers {
    if (teams[Dragons]?.players.count)! < totalPlayersPerTeam {
        teams[Dragons]?.players.append(key)
        players[key]?.team = Dragons
        teams[Dragons]?.height += (players[key]?.height)!
        
    } else if (teams[Sharks]?.players.count)! < totalPlayersPerTeam {
        teams[Sharks]?.players.append(key)
        players[key]?.team = Sharks
        teams[Sharks]?.height += (players[key]?.height)!
        
    } else if (teams[Raptors]?.players.count)! < totalPlayersPerTeam {
        teams[Raptors]?.players.append(key)
        players[key]?.team = Raptors
        teams[Raptors]?.height += (players[key]?.height)!
        
    } else {
        print("All teams filled with inexperienced players")
    }
}

// Loop to generate Welcome letter to parents.
for (key, value) in players {
    let name = key
    let guardian = value.guardians
    let team = value.team!
    let date = teams[value.team!]!.date
    let time = teams[value.team!]!.time
    
    print("Hello \(guardian), we are thrilled to have \(name) on the \(team) Team this year! Please note that our first practice will be on \(date) at \(time). We look forward to seeing you and your child there.")
}
