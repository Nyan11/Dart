Class {
	#name : 'DartFederationUI',
	#superclass : 'SpPresenter',
	#instVars : [
		'notebook',
		'requirementReferencesList',
		'documentReferencesTree',
		'requirementReferenceCode',
		'federation',
		'selectionHandled'
	],
	#category : 'DartSpec',
	#package : 'DartSpec'
}

{ #category : 'layout' }
DartFederationUI >> defaultLayout [

	^ SpPanedLayout newVertical
		  add: notebook;
		  add: requirementReferenceCode;
		  yourself
]

{ #category : 'accessing' }
DartFederationUI >> federation [

	^ federation
]

{ #category : 'accessing' }
DartFederationUI >> federation: aFederation [

	federation := aFederation.
	self updatePresenter
]

{ #category : 'initialization' }
DartFederationUI >> initializePresenters [

	selectionHandled := false.

	notebook := self newNotebook.
	requirementReferencesList := self newTable.
	documentReferencesTree := self newTreeTable.
	requirementReferenceCode := self newCode.
	notebook
		addPageTitle: 'List' provider: [ requirementReferencesList ];
		addPageTitle: 'Tree' provider: [ documentReferencesTree ].
	documentReferencesTree children: [ :document |
			self federation requirementReferences select: [ :requirement |
				document isDocumentReference and: [ requirement documentReference = document ] ] ].
	requirementReferencesList whenSelectedItemChangedDo: [ :item |
		self selectedItemChanged: item ].
	documentReferencesTree whenSelectedItemChangedDo: [ :item |
		self selectedItemChanged: item ]
]

{ #category : 'initialization' }
DartFederationUI >> selectedItemChanged: anItem [

	self selectionHandled ifTrue: [ ^ self ].
	self selectionHandled: true.
	self unselectAll.
	anItem ifNil: [
			self selectionHandled: false.
			^ self ].
	anItem isDocumentReference ifTrue: [
		documentReferencesTree selectItem: anItem ].
	anItem isRequirementReference ifTrue: [
			requirementReferencesList selectItem: anItem.
			documentReferencesTree selectPath:
				(documentReferencesTree pathIndexOf: {
						 anItem documentReference.
						 anItem }).
			requirementReferenceCode text: anItem contents ].
	self selectionHandled: false
]

{ #category : 'accessing' }
DartFederationUI >> selectionHandled [

	^ selectionHandled
]

{ #category : 'accessing' }
DartFederationUI >> selectionHandled: anObject [

	selectionHandled := anObject
]

{ #category : 'api - selection' }
DartFederationUI >> unselectAll [

	requirementReferencesList unselectAll.
	documentReferencesTree unselectAll.
	requirementReferenceCode text: ''
]

{ #category : 'accessing' }
DartFederationUI >> updatePresenter [

	super updatePresenter.
	self federation ifNil: [ ^ self ].
	requirementReferencesList items:
		self federation requirementReferences.
	documentReferencesTree items: self federation documentReferences
]
