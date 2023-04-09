package engine

import (
	"fmt"
	"runtime/debug"

	_ "golang.org/x/mobile/bind"
)

type Delegate interface {
	Done(int)
}

type Logic struct {
	delegate Delegate
}

func NewLogic(delegate Delegate) *Logic {
	return &Logic{
		delegate: delegate,
	}
}

func (l *Logic) ExecuteJob(job int) {
	l.delegate.Done(job + 1)
}

func (l *Logic) Free() {
	l.delegate = nil
	debug.FreeOSMemory()
	fmt.Println(">>> gomobile: set delegate to nil and free memory")
}
