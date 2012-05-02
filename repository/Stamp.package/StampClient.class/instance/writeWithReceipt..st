writing
writeWithReceipt: outgoingFrame
	| receiptId incomingFrame |
	receiptId := self nextId.
	outgoingFrame receipt: receiptId.
	outgoingFrame writeOn: self medium.
	incomingFrame := self read.
	"It is possible that we receive a MESSAGE frame..."
	self assert: incomingFrame command = #RECEIPT.
	self assert: incomingFrame receiptId = receiptId