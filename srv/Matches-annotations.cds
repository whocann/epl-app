using com.epl.CatalogService from './cat-service';

annotate CatalogService.Matches with @(
  UI:{
    Identification: [{ Value: '{i18n>matches}' }],
    SelectionFields: [ matchDate, homeTeam_ID, awayTeam_ID ],
    LineItem: [
			{ Value: matchDate, Label: '{i18n>matchDate}' },            
      { Value: homeTeamName, Label: '{i18n>homeTeam}' },  
      { Value: homeTeamScore },
      { Value: ':' },
      { Value: awayTeamScore },
      { Value: awayTeamName, Label: '{i18n>awayTeam}' }
    ]
  }
){
  matchDate @title:'{i18n>matchDate}';
  homeTeamName @title:'{i18n>homeTeam}';
  awayTeamName @title:'{i18n>awayTeam}';
  homeTeam_ID @title:'{i18n>homeTeam}';
	homeTeam @(
		Common.Text: { $value: homeTeam.name, "@UI.TextArrangement": #TextOnly },
		Common.ValueList.entity:'CatalogService.Teams',
    Common.ValueList.Label: 'aaaa',
    // Common.ValueList.CollectionPath: 'CatalogService.Teams',
		Common.ValueList.Parameters:[
			 { $Type:'Common.ValueListParameterInOut', LocalDataProperty: homeTeam_ID, ValueListProperty:'ID' },
      { $Type:'Common.ValueListParameterDisplayOnly', ValueListProperty:'name' },
		],
	){
    ID @title: '{i18n>homeTeam}';
  };
  awayTeam @(
    ValueList.entity:'CatalogService.Teams'
  );
};