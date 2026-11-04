Class {
	#name : 'DartBlockDocumentFormat',
	#superclass : 'DartDocumentFormat',
	#instVars : [
		'block'
	],
	#category : 'DartRequirementFederation',
	#package : 'DartRequirementFederation'
}

{ #category : 'accessing' }
DartBlockDocumentFormat >> block [

	^ block
]

{ #category : 'accessing' }
DartBlockDocumentFormat >> block: anObject [

	block := anObject
]

{ #category : 'as yet unclassified' }
DartBlockDocumentFormat >> findRequirementsFor: aDartDocumentReference [

	^ (self block value: aDartDocumentReference file contents) collect: [
			  :each |
			  DartRequirementReference new
				  contents: each;
				  format: self;
				  document: aDartDocumentReference;
				  yourself ]
]
