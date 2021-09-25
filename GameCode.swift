//created by Justin on 09/24/2021

import Foundation

let ball = OvalShape(width: 40, height: 40)

let barrierWidth = 300.0
let barrierHeight = 25.0

let barrierPoints = [
    Point(x: 0, y: 0),
    Point(x: 0, y: barrierHeight),
    Point(x: barrierWidth, y:
       barrierHeight),
    Point(x: barrierWidth, y: 0)
]

let barrier = PolygonShape(points:
   barrierPoints)


/*
The setup() function is called once when the app launches. Without it, your app won't compile.
Use it to set up and start your app.

You can create as many other functions as you want, and declare variables and constants,
at the top level of the file (outside any function). You can't write any other kind of code,
for example if statements and for loops, at the top level; they have to be written inside
of a function.
*/



fileprivate func     setupBall() {
    ball.position = Point(x: 250, y: 400)
    scene.add(ball)
    ball.hasPhysics = true
    ball.fillColor = .blue
}

fileprivate func     setupBarrier() {
    // Add a barrier to the scene.
    barrier.position = Point(x: 200, y: 150)
    barrier.hasPhysics = true
    scene.add(barrier)
    barrier.isImmobile = true
}

func setup() {
    setupBall()
    
    setupBarrier()
    
    let funnelPoints = [
        Point(x: 0, y: 50),
        Point(x: 80, y: 50),
        Point(x: 60, y: 0),
        Point(x: 20, y: 0)
    ]
    
    let funnel = PolygonShape(points:
       funnelPoints)
    
    // Add a funnel to the scene.
    funnel.position = Point(x: 200, y:
       scene.height - 25)
    scene.add(funnel)
    
    funnel.onTapped = dropBall
    
    // Drops the ball by moving it to the funnel's position.
    func dropBall() {
        let funnel = PolygonShape(points:
           funnelPoints)
        
        // Add a funnel to the scene.
        funnel.position = Point(x: 200, y:
           scene.height - 25)
        scene.add(funnel)
        
        funnel.onTapped = dropBall
        ball.position = funnel.position
    }
}

func setupTarget() {
    
    let target = PolygonShape(points:
       targetPoints)
    
    target.position = Point(x: 200, y: 400)
    target.hasPhysics = true
    target.isImmobile = true
    target.isImpermeable = false
    target.fillColor = .yellow

    scene.add(target)
    
    let targetPoints = [
        Point(x: 10, y: 0),
        Point(x: 0, y: 10),
        Point(x: 10, y: 20),
        Point(x: 20, y: 10)
    ]

    func setup() {
    // Add a target to the scene.
        setupTarget()
    }
}


