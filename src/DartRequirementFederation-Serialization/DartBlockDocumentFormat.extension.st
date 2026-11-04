Extension { #name : 'DartBlockDocumentFormat' }

{ #category : '*DartRequirementFederation-Serialization' }
DartBlockDocumentFormat >> asStashConstructor [

	^ 'DartDocumentFormat block: <1s>'
		  expandMacrosWith: self block printString
]
