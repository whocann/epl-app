module.exports = srv => {

  const {Matches} = srv.entities("com.epl")

  srv.after("READ", "LeagueTable", async (teams) => {
    if (teams[0].counted) {
      //$count=true
      return
    }

    const matches = await SELECT.from(Matches)

    matches.forEach(match => {
      //home team
      const ht = teams.find(team => team.ID === match.homeTeam_ID)
      //away team
      const at = teams.find(team => team.ID === match.awayTeam_ID)
      ht.gamesPlayed++
      at.gamesPlayed++
      if (match.homeTeamScore === match.awayTeamScore) {
        ht.points += 1
        at.points += 1
        ht.draw++
        at.draw++
      } else if (match.homeTeamScore > match.awayTeamScore) {
        ht.points += 3
        ht.win++
        at.lose++
      } else if (match.homeTeamScore < match.awayTeamScore) {
        at.points += 3
        ht.lose++
        at.win++
      }
    })
    teams.sort((a, b) => b.points - a.points)
    let i = 1
    teams.forEach(t => t.rank = i++)
  })
}