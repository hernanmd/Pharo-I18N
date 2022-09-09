Class {
	#name : #BaselineOfI18N,
	#superclass : #BaselineOf,
	#category : #BaselineOfI18N
}

{ #category : #baselines }
BaselineOfI18N >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		"Packages"
		spec 
			package: 'I18N-Core';
			package: 'I18N-Tests-Core' with: [ spec requires: #('I18N-Core' ) ].

		"Versions"
		spec 
			for: #(#'pharo7.x' #'pharo8.x' #'pharo9.x')
			do: [ 
				spec 
					package: 'I18N-Tools' with: [ spec requires: #('I18N-Core' ) ];
					group: 'Tools' with: #('I18N-Tools' ) ].
		spec 
			for: #(#'pharo10.x' #'pharo11.x')
			do: [ 
				spec 
					package: 'I18N-Tools-Spec2' with: [ spec requires: #('I18N-Core') ];
					group: 'Tools' with: #('I18N-Tools-Spec2' ) ].

		"Groups"	
		spec 
			group: 'Core' with: #('I18N-Core' );
			group: 'Tests' with: #('I18N-Tests-Core' );
			group: 'all' with: #('Core' 'Tools' 'Tests' );
			group: 'default' with: #('all' ) ]
]
