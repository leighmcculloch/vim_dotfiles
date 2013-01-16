command! GolangTestCurrentPackage :call GolangTestCurrentPackage()

function! GolangCurrentPackage()
  let packageLine = search("package", "s")
  ''

  let packageName = split(getline(packageLine), " ")[1]
  let packagePath = [packageName]
  let lastGoPathDir = split($GOPATH, "/")[-1]


  " bufname = "go/src/venmo_sdk_backend/models/merchant"
  " packagename = "merchant"
  " cmd = "go test venmo_sdk_backend/models/authcode//... -env=test"
  " models/venmo_sdk_backend/src/merchant

  let splitBuf = split(bufname("%"), "/")
  echo len(splitBuf)
  let i = len(splitBuf) - 1
  while splitBuf[i] != lastGoPathDir
    call insert(packagePath, splitBuf[i])
    let i = i - 1
  endwhile
  return join(packagePath, "/")
endfunction

function! GolangTestCurrentPackage()
  call VimuxRunCommand("clear; cd $GOPATH; go test " . GolangCurrentPackage())
endfunction
