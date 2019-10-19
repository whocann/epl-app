namespace com.epl;

using { managed, cuid } from '@sap/cds/common';

entity Teams : managed {
  key ID : Integer;
  name : String(30);
}

entity Matches: cuid, managed {
  matchDate: Date;
  homeTeam : Association to Teams;
  awayTeam: Association to Teams;
  homeTeamScore: String(6);
  awayTeamScore: String(5);
}