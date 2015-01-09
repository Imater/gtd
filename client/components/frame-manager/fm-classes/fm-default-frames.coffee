angular.module "gtdhubApp"
  .factory "fmDefaultFrames", (FmFrames, FmRow, FmCol, FmFrame, FmMenu, fmMenuItems)->
    c11 = new FmCol
      frames: [
        new FmFrame
          height: "100%"
      ]
      width: "100%"

    c21 = new FmCol
      frames: [
        new FmFrame
          height: "100%"
          background: "green"
          menu: new FmMenu
            selected: 0
            selectedMenu: 1
      ]
      width: "150px"

    c22 = new FmCol
      frames: [
        new FmFrame
          height: "100%"
          viewName: 'tree'
          menu: new FmMenu
            selected: 0
      ]
      width: "200px"

    c23 = new FmCol
      frames: [
        new FmFrame
          height: "100%"
          viewName: 'editor'
          menu: new FmMenu
            selected: 1
      ]
      width: "auto"

    c24 = new FmCol
      frames: [
        new FmFrame
          height: "70%"
          background: "green"
      ,
        new FmFrame
          height: "30%"
          background: "yellow"
      ]
      width: "150px"

    c25 = new FmCol
      frames: [
        new FmFrame
          height: "100%"
          background: "darkgreen"
      ]
      width: "50px"
    row1 = new FmRow [c11], "20%"
    row2 = new FmRow [c21, c22, c23, c24], "80%"
    row2.addCols c25
    t = new FmFrames([row2])
    return t

