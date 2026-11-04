Class {
	#name : 'DartDocumentFormat',
	#superclass : 'Object',
	#category : 'DartRequirementFederation',
	#package : 'DartRequirementFederation'
}

{ #category : 'accessing' }
DartDocumentFormat class >> block: aBlockClosure [

	^ DartBlockDocumentFormat new block: aBlockClosure; yourself
]

{ #category : 'accessing' }
DartDocumentFormat class >> text [

	^ DartTextDocumentFormat new
]

{ #category : 'as yet unclassified' }
DartDocumentFormat >> findRequirementsFor: aDartDocumentReference [

	^ self shouldBeImplemented
]
