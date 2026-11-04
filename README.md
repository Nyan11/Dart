# Dart
DynAmic Requirement Tracing is a framework used to manage and to analyse traces between design documents and an application.

## How to get Dart

To install the lastest version of Dart, use the following scripts inside a playground.

```st
Metacello new
	baseline: 'Dart';
	repository: 'github://Nyan11/Dart:main';
	onConflictUseLoaded;
	load
```

### Add in your baseline

```st
spec baseline: 'Dart' with: [ spec repository: 'github://Nyan11/Dart:main' ].
```

## How to use Dart

### Create a Requirement Federation

```st
| doc repository storedRepository |
	doc := 'a/path/to/your/document' asDocumentReference.
	doc defineFormat: (DartDocumentFormat block: [ :contents |
				 ('' join: {
						  Character cr.
						  Character cr }) split: contents ]).
	repository := DartDocumentFederation new
		              addDocumentReference: doc;
		              yourself.
	repository storeIn: MyFederationClass.
	storedRepository := MyFederationClass federation.
```

### Add links between the federated requirements and the application

```st
| repository |
  repository := DartLinkRepository new
		              backendClass: DartDynamicLinkMpBackend;
		              yourself.
  repository
		        addLinkToBehaviour: ObjectToTrace >> #methodToTrace
		        withRequirement: MyFederationClass req_xxxx_xxxx.
```

## Dependencies

- [Stash](https://github.com/ThalesGroup/Stash) - A serializer instance to code for Pharo.
- [MethodProxies](https://github.com/pharo-contributions/MethodProxies) - A library to decorate and control method execution.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
