module.exports = srv => {
  const { Matches, Teams } = srv.entities("com.epl");

  srv.after("READ", "LeagueTable", async (teams, req) => {
    // if (teams[0].counted) {
    //   return await cds.transaction(req).read(Teams);
    // //  return cds.transaction(req).run(SELECT.from(Matches)).then(() => {})
    // }

    const tx = cds.transaction(req);
    const m = await tx.run(SELECT.from(Matches));

    m.forEach(match => {
      if (teams && !teams[0].counted) {
        const ht = teams.find(team => team.ID === match.homeTeam_ID);
        const at = teams.find(team => team.ID === match.awayTeam_ID);
        ht.gamesPlayed++;
        at.gamesPlayed++;
        if (match.homeTeamScore === match.awayTeamScore) {
          ht.points += 1;
          at.points += 1;
          ht.draw++;
          at.draw++;
        } else if (match.homeTeamScore > match.awayTeamScore) {
          ht.points += 3;
          ht.win++;
          at.lose++;
        } else if (match.homeTeamScore < match.awayTeamScore) {
          at.points += 3;
          ht.lose++;
          at.win++;
        }
      }
    });

    return m;
  });
};
