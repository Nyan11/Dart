Class {
	#name : 'BaselineOfDart',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfDart',
	#package : 'BaselineOfDart'
}

{ #category : 'baselines' }
BaselineOfDart >> baseline: spec [

	<baseline>
	spec for: #common do: [
			spec
				baseline: 'StashSerialization'
				with: [ spec repository: 'github://ThalesGroup/Stash:main' ].
			spec
				baseline: 'MethodProxies'
				with: [
				spec repository: 'github://pharo-contributions/MethodProxies/src' ].

			"Federation of Requirement"
			spec
				package: 'DartRequirementFederation';
				package: 'DartRequirementFederation-Serialization'
				with: [ spec requires: #( 'DartRequirementFederation' ) ];
				package: 'DartRequirementFederation-Tests' with: [
						spec requires:
								#( 'DartRequirementFederation' 'DartRequirementFederation-Serialization' ) ].

			"Dynamic Links"
			spec
				package: 'DartDynamicLinks';
				package: 'DartDynamicLinks-MethodProxies'
				with: [ spec requires: #( 'DartDynamicLinks' 'MethodProxies' ) ];
				package: 'DartDynamicLinks-Tests' with: [
						spec requires:
								#( 'DartDynamicLinks' 'DartDynamicLinks-MethodProxies' ) ].

			spec
				group: 'Core' with: #( 'RequirementFederation'
					   'DynamicLinks' );
				group: 'DynamicLinks'
				with: #( 'DartDynamicLinks' 'DartDynamicLinks-MethodProxies'
					   'DartLinks-Tests' );
				group: 'RequirementFederation'
				with:
					#( 'DartRequirementFederation' 'DartRequirementFederation-Serialization'
					   'DartRequirementFederation-Tests' ) ]
]
