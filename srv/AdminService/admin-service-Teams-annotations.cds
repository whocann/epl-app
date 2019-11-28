using com.epl.AdminService from './admin-service';

annotate AdminService.Teams with @(
  UI: {
    Identification : [name],
    SelectionFields: [name],
      LineItem: [
			  { Value: ID, Label: '{i18n>ID}' },            
        { Value: name, Label: '{i18n>name}' }
      ]
  }
){
	ID @title:'{i18n>ID}' @UI.HiddenFilter;
	name @title:'{i18n>name}';
}

//annotate CatalogService.Teams with @cds.odata.valuelist;


annotate AdminService.Teams with @(
	UI: {
		HeaderFacets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Description}', Target: '@UI.FieldGroup#General'},
		],
    Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'}
		],
		FieldGroup#General: {
			Data: [
				{Value: ID},
				{Value: name}
			]
		}
	}
);

annotate AdminService.Teams with @(
	UI: {
  	HeaderInfo: {
  		TypeName: '{i18n>Book}',
  		TypeNamePlural: '{i18n>Books}',
  		Title: {Value: ID},
  		Description: {Value: name}
  	},
	}
);