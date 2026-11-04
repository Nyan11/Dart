Extension { #name : 'FileReference' }

{ #category : '*DartRequirementFederation' }
FileReference >> asDocumentReference [

	^ DartDocumentReference new file: self; yourself
]
