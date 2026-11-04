Extension { #name : 'DartDocumentReference' }

{ #category : '*DartRequirementFederation-Serialization' }
DartDocumentReference >> stashAccessors [


	^ {
		  [ :doc | 'file: <1p>' expandMacrosWith: doc file path printString ]
			  onlySetOnStash.
		  #format }
]

{ #category : '*DartRequirementFederation-Serialization' }
DartDocumentReference >> stashAccessorsForRequirements [

	<stashAccessors>
	^ {
		  [ :doc | 'file: <1p>' expandMacrosWith: doc file path printString ]
			  onlySetOnStash.
		  #format } , (self requirementReferences collect: [ :req |
		  #addRequirementReference: -> [ :doc | req ] ])
]
