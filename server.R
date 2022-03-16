#Assignment 3

server <- function(input, output) {
  
  output$dcm <- renderPlot({
      if(input$dcm_widget == 1) {
        param.dcm <- param.dcm(inf.prob = 0.387, act.rate = 0.19, rec.rate = 0.031)
        init.dcm <- init.dcm(s.num = 1500, i.num = 347, r.num = 0)
        control.dcm <- control.dcm(type = "SIR", nsims = 10, nsteps = 400)
        mod.dcm <- dcm(param.dcm, init.dcm, control.dcm)
        plot(mod.dcm)
      }
      else {
        param.dcm <- param.dcm(inf.prob = 0.24, act.rate =  0.19, rec.rate = 0.031)
        init.dcm <- init.dcm(s.num = 1500, i.num = 347, r.num = 0)
        control.dcm <- control.dcm(type = "SIR", nsims = 10, nsteps = 400)
        mod.dcm <- dcm(param.dcm, init.dcm, control.dcm)
        plot(mod.dcm)
      }
    })
  
  output$icm <- renderPlot({
      if(input$icm_widget == 1) {
        param.icm <- param.icm(inf.prob = 0.387, act.rate = 0.19, rec.rate = 0.031, a.rate = 1/100, ds.rate = 1/100, di.rate = 1/90, dr.rate = 1/100)
        init.icm <- init.icm(s.num = 1500, i.num = 347, r.num = 0)
        control.icm <- control.icm(type = "SIR", nsims = 10, nsteps = 400)
        mod.icm <- icm(param.icm, init.icm, control.icm)
        plot(mod.icm)
      }
      else {
        param.icm <- param.icm(inf.prob = 0.24, act.rate = 0.19, rec.rate = 0.031, a.rate = 1/100, ds.rate = 1/100, di.rate = 1/90, dr.rate = 1/100)
        init.icm <- init.icm(s.num = 1000, i.num = 347, r.num = 0)
        control.icm <- control.icm(type = "SIR", nsims = 10, nsteps = 400)
        mod.icm <- icm(param.icm, init.icm, control.icm)
        plot(mod.icm)
      }
    })
  
}

