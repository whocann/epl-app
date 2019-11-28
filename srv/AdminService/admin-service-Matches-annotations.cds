using com.epl.AdminService from './admin-service';

annotate AdminService.Matches with @(
  UI:{
    Identification: [{ Value: '{i18n>matches}' }],
    SelectionFields: [ 'matchDate','homeTeam_ID','awayTeam_ID' ],
    LineItem: [
			{ Value: matchDate, Label: '{i18n>matchDate}' },            
      { Value: homeTeam.name, Label: '{i18n>homeTeam}' },  
      { Value: homeTeamScore },
      { Value: ':' },
      { Value: awayTeamScore },
      { Value: awayTeam.name, Label: '{i18n>awayTeam}' }
    ]
  }
){
  matchDate @title:'{i18n>matchDate}';
  homeTeam @(
    Common: {
      Label: '{i18n>homeTeam}',
      ValueList: {
        Label: '{i18n>homeTeam}',
        CollectionPath: 'Teams',
        Parameters:[
			    { $Type:'Common.ValueListParameterInOut', LocalDataProperty: 'homeTeam_ID', ValueListProperty:'ID' },
          { $Type:'Common.ValueListParameterDisplayOnly', ValueListProperty:'name' },
		    ]
      }
    }
  );
  awayTeam @(
    Common: {
      Label: '{i18n>awayTeam}'
    }
  );
};