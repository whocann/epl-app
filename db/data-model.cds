namespace com.epl;

using { managed, cuid, sap.common.CodeList } from '@sap/cds/common';

type Team : Association to Teams;

entity Teams : managed, CodeList {
  key ID : Integer @(title : '{i18n>homTeam}');
  //name : localized String(255) @title:'{i18n>homeTeam}';
}

entity Matches: cuid, managed {
  matchDate: Date;
  homeTeam : Team;
  awayTeam: Team;
  homeTeamScore: Integer;
  awayTeamScore: Integer;
}
