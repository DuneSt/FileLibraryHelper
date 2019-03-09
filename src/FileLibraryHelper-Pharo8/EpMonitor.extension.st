Extension { #name : #EpMonitor }

{ #category : #'*FileLibraryHelper-Pharo8' }
EpMonitor class >> disableDuring: aBlock [
	"Disable the default monitor during the execution of a block"

	self current disableDuring: aBlock
]

{ #category : #'*FileLibraryHelper-Pharo8' }
EpMonitor >> disableDuring: aBlock [
	"Disable all logging during the execution of a block.
	
	Example:
		EpMonitor current disableDuring: [ self generateApplicationTemplate ]"

	| currentStatus |
	currentStatus := self isEnabled.
	self disable.
	[ aBlock value ]
		ensure: [ self enabled: currentStatus ]
]
