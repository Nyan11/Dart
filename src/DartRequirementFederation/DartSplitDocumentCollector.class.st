Class {
	#name : 'DartSplitDocumentCollector',
	#superclass : 'DartRequirementsCollector',
	#instVars : [
		'spliter',
		'thenDoBlock'
	],
	#category : 'DartRequirementFederation',
	#package : 'DartRequirementFederation'
}

{ #category : 'requirements' }
DartSplitDocumentCollector >> collectRequirements [

	| groups |
	groups := self spliter split: self documentReference file contents.
	^ groups collectWithIndex: [ :contents :index |
			  | requirement |
			  requirement := DartRequirementReference new
				                 documentReference: self documentReference;
				                 requirementCollector: self;
				                 contents: contents;
				                 requirementNumber: index;
				                 yourself.
			  self thenDoBlock ifNotNil: [ :b |
				  b value: requirement value: contents ].
			  requirement ]
]

{ #category : 'splitjoin' }
DartSplitDocumentCollector >> splitOn: aStringOrMacros [

	spliter := aStringOrMacros expandMacros.
]

{ #category : 'splitjoin' }
DartSplitDocumentCollector >> splitOn: aStringOrMacros thenDo: aBlock [

	self splitOn: aStringOrMacros.
	thenDoBlock := aBlock
]

{ #category : 'accessing' }
DartSplitDocumentCollector >> spliter [

	^ spliter
]

{ #category : 'accessing' }
DartSplitDocumentCollector >> thenDoBlock [

	^ thenDoBlock
]
