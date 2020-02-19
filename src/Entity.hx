

class Entity {
    public static var ALL : Array<Entity> = new Array<Entity>();

    public var radius : Float = 16;
    public var rotation : Float = 0; // radians
    public var cx : Int;
    public var cy : Int;
    public var xr : Float;
    public var yr : Float;

    public var xx : Float;
    public var yy : Float;

    public var dx : Float = 0;
    public var dy : Float = 0;

    public function new(x, y) {
        setCoordinates(x,y);
        trace(xx);
        trace(yy);
        trace(cx);
        trace(cy);
        ALL.push(this);
    }

    public function setCoordinates(x, y) {
        xx = x;
        yy = y;
        cx = Std.int(xx/32);
        cy = Std.int(yy/32);
        xr = (xx - cx*32)/32;
        yr = (yy - cy*32)/32;
    }

    inline public function overlaps(e: Entity) {
        var maxDist = radius + e.radius;
        var distSqr = (e.xx - xx)*(e.xx - xx) + (e.yy-yy)*(e.yy-yy);
        return distSqr <= maxDist * maxDist;
    }

    public function hasCollision(x, y) {
        for (s in Solid.ALL) {
            // trace('SOLID ${s.cx} ${s.cy}');
            if (x == s.cx && y == (s.cy + 1))
                return true;
        }
        return false;
    }

    public function update(dt:Float) {
        var old_xr = xr;
        var old_yr = yr;
        xr += dx * dt;
        yr += dy * dt;
        xx = (cx + xr) * 32;
        yy = (cy + yr) * 32;
        dx = Math.min(30, dx);
        dy = Math.min(30, dy);
        dx *= 0.60;
        dy *= 0.60;
        
        if (xr < 0.3) {
            if (hasCollision(cx - 1, cy)) {
                trace(1);
                stop();
                xr = 0.3;
            }
        }
        if (xr > 0.7) {
            if (hasCollision(cx + 1, cy)) {
                trace(4);
                stop();
                xr = 0.7;
            }
        }
        if (yr < 0.3) {
            if (hasCollision(cx, cy - 1)) {
                trace(7);
                stop();
                yr = 0.3;
            }
        }
        if (0.7 < yr) {
            if (hasCollision(cx, cy + 1)) {
                trace(10);
                stop();
                yr = 0.7;
            }
        }
        if (xr < 0.3) {
            if (yr < 0.3) {
                if (hasCollision(cx - 1, cy - 1)) {
                    trace(2);
                    stop();
                    if (yr > xr) {
                        yr = 0.3;
                    } else {
                        xr = 0.3;
                    }
                }
            }
            if (0.7 < yr) {
                if (hasCollision(cx - 1, cy + 1)) {
                    trace(3);
                    stop();
                    yr = 0.7;
                }
            }
        }
        if (xr > 0.7) {
            if (yr < 0.3) {
                if (hasCollision(cx + 1, cy - 1)) {
                    trace(5);
                    stop();
                    yr = 0.3;
                }
            }
            if (0.7 < yr) {
                if (hasCollision(cx + 1, cy + 1)) {
                    trace(6);
                    stop();
                    yr = 0.7;
                }
            }
        }


        // y managment
        if (yr < 0.3) {
            if (xr < 0.3) {
                if (hasCollision(cx - 1, cy - 1)) {
                    trace(8);
                    stop();
                    yr = 0.3;
                }
            }
            if (0.7 < xr) {
                if (hasCollision(cx + 1, cy)) {
                    trace(9);
                    stop();
                    yr = 0.3;
                }
            }
        }
        if (0.7 < yr) {
            if (xr < 0.3) {
                if (hasCollision(cx - 1, cy + 1)) {
                    trace(11);
                    stop();
                    yr = 0.7;
                }
            }
            if (0.7 < xr) {
                if (hasCollision(cx + 1, cy + 1)) {
                    trace(12);
                    stop();
                    yr = 0.7;
                }
            }
        }
        // if (hasCollision(cx + 1, cy) && xr > 0.7) {
        //     trace(1);
        //     xr = 0.7;
        //     dx = 0;
        // }
        // if (hasCollision(cx - 1, cy) && xr < 0.3) {
        //     trace(2);
        //     trace(2);
        //     xr = 0.3;
        //     dx = 0;
        // }
        // if (hasCollision(cx, cy + 1) && yr > 0.7) {
        //     trace(3);
        //     yr = 0.7;
        //     dy = 0;
        // }
        // if (hasCollision(cx, cy - 1) && yr < 0.3) {
        //     trace(4);
        //     yr = 0.3;
        //     dy = 0;
        // }
        // if (hasCollision(cx - 1, cy - 1) && (yr < 0.3 && xr < 0.3)) {
        //     trace(5);
        //     dy = 0;
        //     dx = 0;
        //     trace(yr);
        //     trace(xr);
        //     yr = Math.max(0.3, yr);
        //     xr = Math.max(0.3, xr);
        // }
        // if (hasCollision(cx + 1, cy + 1) && yr < 0.7 && xr < 0.7) {
        //     trace(5);
        //     yr = Math.min(0.7, yr);
        //     xr = Math.min(0.7, xr);
        //     dy = 0;
        //     dx = 0;
        // }

        // for (e in ALL) {
        //     if (e != this && Math.abs(cx - e.cx) <= 2 && Math.abs(cy - e.cy) <= 2) {
        //         var dist = Math.sqrt((xx - e.xx)*(xx - e.xx) - (yy - e.yy)*(yy - e.yy));
        //         if (dist <= radius + e.radius) {
        //             var ang = Math.atan2(e.yy - yy, e.xx - xx);
        //             var force = 0.2;
        //             var repelPower = (radius+e.radius - dist) / (radius+e.radius);
        //             dx -= Math.cos(ang) * repelPower * force;
        //             dy -= Math.sin(ang) * repelPower * force;
        //             e.dx += Math.cos(ang) * repelPower * force;
        //             e.dy += Math.sin(ang) * repelPower * force;
        //         }
        //     }
        // }
        var old_cy = cy;
        var old_cx =  cx;
        while (xr > 1) {
            trace('Moved Right');
            xr--;
            cx++;
        }
        while (xr < 0) {
            trace('Moved Left');
            xr++;
            cx--;
        }
        while (yr > 1) {
            trace('Moved Down');
            yr--;
            cy++;
        }
        while (yr < 0) {
            trace('Moved Down');
            yr++;
            cy--;
        }

        if (old_cx != cx || old_cy != cy) {
            trace('[${cx} ${cy}]');
        }

        if (Math.round(old_xr*100) != Math.round(xr*100) || Math.round(old_yr*100) != Math.round(yr*100)) {
            trace('[${xr} ${yr}]');
        }
    }

    public function stop() {
        dx = 0;
        dy = 0;
    }
}