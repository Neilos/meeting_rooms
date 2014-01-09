
d3.gantt = function () {
    var FIT_TIME_DOMAIN_MODE = "fit",
        FIXED_TIME_DOMAIN_MODE = "fixed";

    var margin = {
        top: 30,
        right: 40,
        bottom: 20,
        left: 150
    };

     // default initial values, which may be overridden later
    var timeDomainStart = d3.time.day.offset(new Date(), -3),
        timeDomainEnd = d3.time.hour.offset(new Date(), +3),
        timeDomainMode = FIT_TIME_DOMAIN_MODE, // fixed or fit
        reservationTypes = [],
        reservationStatus = [],
        height = 500,
        width = 500,
        tickFormat = "%H:%M",
        x = d3.time.scale().domain([timeDomainStart, timeDomainEnd]).range([0, width]).clamp(true),
        y = d3.scale.ordinal().domain(reservationTypes).rangeRoundBands([0, height - margin.top - margin.bottom], .5, 2),
        xAxis = d3.svg.axis().scale(x).orient("bottom"),
        yAxis = d3.svg.axis().scale(y).orient("left");

    var keyFunction = function (d) {
        return d.startDate + d.reservationName + d.endDate;
    };

    var rectTransform = function (d) {
        return "translate(" + x(d.startDate) + "," + y(d.reservationName) + ")";
    };

    var initTimeDomain = function () {
        if (timeDomainMode === FIT_TIME_DOMAIN_MODE) {
            if (reservations === undefined || reservations.length < 1) {
                // set a minimum sized time domain if there is nothing or only one data item to plot
                timeDomainStart = d3.time.day.offset(new Date(), -3);
                timeDomainEnd = d3.time.hour.offset(new Date(), +3);
                return;
            } else {
                // set the time domain to span all the data items being plotted
                reservations.sort(function (a, b) {
                    return a.endDate - b.endDate;
                });
                timeDomainEnd = reservations[reservations.length - 1].endDate;
                reservations.sort(function (a, b) {
                    return a.startDate - b.startDate;
                });
                timeDomainStart = reservations[0].startDate;
            }
        }
    };

    var initAxis = function () {
        x = d3.time.scale().domain([timeDomainStart, timeDomainEnd]).range([0, width]).clamp(true).nice();
        y = d3.scale.ordinal().domain(reservationTypes).rangeRoundBands([0, height - margin.top - margin.bottom], .5, 1);
        xAxis = d3.svg.axis().scale(x).orient("top");
        xAxis.tickFormat(d3.time.format(tickFormat));
        xAxis.ticks(5);
        xAxis.tickSubdivide(true);
        xAxis.innerTickSize(-height + margin.top + margin.bottom);
        xAxis.tickPadding(15);

        yAxis = d3.svg.axis().scale(y).orient("left")
        yAxis.tickSize(0);
        yAxis.tickPadding(20);
    };

    function gantt(reservations) {

        initTimeDomain();
        initAxis();

        var svg = d3.select("body")
            .append("svg")
                .attr("class", "chart")
                .attr("width", width + margin.left + margin.right)
                .attr("height", height + margin.top + margin.bottom)
            .append("g")
                .attr("class", "gantt-chart")
                .attr("width", width + margin.left + margin.right)
                .attr("height", height + margin.top + margin.bottom)
                .attr("transform", "translate(" + margin.left + ", " + margin.top + ")");

        svg.selectAll(".chart")
            .data(reservations, keyFunction).enter()
            .append("rect")
                .attr("rx", 2)
                .attr("ry", 2)
                .attr("class", function (d) {
                    if (reservationStatus[d.status] == null) {
                        return "booking";
                    }
                    return reservationStatus[d.status];
                })
                .attr("y", 0)
                .attr("transform", rectTransform)
                .attr("height", function (d) {
                    return y.rangeBand();
                })
                .attr("width", function (d) {
                    return (x(d.endDate) - x(d.startDate));
                });


        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0, " - margin.top + ")")
            .transition()
            .call(xAxis);

        svg.append("g").attr("class", "y axis").transition().call(yAxis);

        return gantt;

    };

    gantt.redraw = function (reservations) {

        initTimeDomain();
        initAxis();

        var svg = d3.select("svg");

        var ganttChartGroup = svg.select(".gantt-chart");
        var rect = ganttChartGroup.selectAll("rect").data(reservations, keyFunction);

        rect.enter()
            .insert("rect", ":first-child")
            .attr("rx", 2)
            .attr("ry", 2)
            .attr("class", function (d) {
                if (reservationStatus[d.status] == null) {
                    return "booking";
                }
                return reservationStatus[d.status];
            })
            .transition()
            .attr("y", 0)
            .attr("transform", rectTransform)
            .attr("height", function (d) {
                return y.rangeBand();
            })
            .attr("width", function (d) {
                return (x(d.endDate) - x(d.startDate));
            });

        rect.transition()
            .attr("transform", rectTransform)
            .attr("height", function (d) {
                return y.rangeBand();
            })
            .attr("width", function (d) {
                return (x(d.endDate) - x(d.startDate));
            });

        rect.exit().remove();

        svg.select(".x").transition().call(xAxis);
        svg.select(".y").transition().call(yAxis);

        return gantt;
    };

    gantt.margin = function (value) {
        if (!arguments.length) return margin;
        margin = value;
        return gantt;
    };

    gantt.timeDomain = function (value) {
        if (!arguments.length) return [timeDomainStart, timeDomainEnd];
        timeDomainStart = +value[0], timeDomainEnd = +value[1];
        return gantt;
    };

    /**
     * @param {string}
     *                vale The value can be "fit" - the domain fits the data or
     *                "fixed" - fixed domain.
     */
    gantt.timeDomainMode = function (value) {
        if (!arguments.length) return timeDomainMode;
        timeDomainMode = value;
        return gantt;

    };

    gantt.reservationTypes = function (value) {
        if (!arguments.length) return reservationTypes;
        reservationTypes = value;
        return gantt;
    };

    gantt.reservationStatus = function (value) {
        if (!arguments.length) return reservationStatus;
        reservationStatus = value;
        return gantt;
    };

    gantt.width = function (value) {
        if (!arguments.length) return width;
        width = +value;
        return gantt;
    };

    gantt.height = function (value) {
        if (!arguments.length) return height;
        height = +value;
        return gantt;
    };

    gantt.tickFormat = function (value) {
        if (!arguments.length) return tickFormat;
        tickFormat = value;
        return gantt;
    };

    return gantt;
};


var reservations = [
{"startDate":new Date("Sun Dec 09 01:36:45 UTC 2013"),"endDate":new Date("Sun Dec 09 02:36:45 UTC 2013"),"reservationName":"Calendar 1","status":"BOOKED"}];

var reservationStatus = {
    "BOOKED" : "booking",
    "UNAVAILABLE" : "booking-unavailable",
    "BOOKEDBYUSER" : "booking-byuser",
    "AVAILABLE" : "booking-available"
};

var reservationNames = [ "Calendar 1", "Calendar 2", "Calendar 3", "Calendar 4", "Calendar 5", "Calendar 6" ];

reservations.sort(function(a, b) {
    return a.endDate - b.endDate;
});
var maxDate = reservations[reservations.length - 1].endDate;
reservations.sort(function(a, b) {
    return a.startDate - b.startDate;
});
var minDate = reservations[0].startDate;

var format = "%H:%M";
var timeDomainString = "1day";

var gantt;



function changeTimeDomain(timeDomainString) {
    this.timeDomainString = timeDomainString;
    switch (timeDomainString) {
    case "1hr":
        format = "%H:%M";
        gantt.timeDomain([ d3.time.hour.offset(getEndDate(), -1), getEndDate() ]);
        break;
    case "3hr":
        format = "%H:%M";
        gantt.timeDomain([ d3.time.hour.offset(getEndDate(), -3), getEndDate() ]);
        break;
    case "6hr":
        format = "%H:%M";
        gantt.timeDomain([ d3.time.hour.offset(getEndDate(), -6), getEndDate() ]);
        break;
    case "1day":
        format = "%H:%M";
        gantt.timeDomain([ d3.time.day.offset(getEndDate(), -1), getEndDate() ]);
        break;
    case "3days":
        format = "%a %H:%M";
        gantt.timeDomain([ d3.time.day.offset(getEndDate(), -3), getEndDate() ]);
        break;
    case "1week":
        format = "%a %H:%M";
        gantt.timeDomain([ d3.time.day.offset(getEndDate(), -7), getEndDate() ]);
        break;
    default:
        format = "%H:%M"
    }
    gantt.tickFormat(format);
    gantt.redraw(reservations);
}

function getEndDate() {
    var lastEndDate = Date.now();
    if (reservations.length > 0) {
        lastEndDate = reservations[reservations.length - 1].endDate;
    }

    return lastEndDate;
}

function addTask() {

    var lastEndDate = getEndDate();
    var reservationStatusKeys = Object.keys(reservationStatus);
    var reservationStatusName = reservationStatusKeys[Math.floor(Math.random() * reservationStatusKeys.length)];
    var reservationName = reservationNames[Math.floor(Math.random() * reservationNames.length)];

    reservations.push({
        "startDate" : d3.time.hour.offset(lastEndDate, Math.ceil(1 * Math.random())),
        "endDate" : d3.time.hour.offset(lastEndDate, (Math.ceil(Math.random() * 3)) + 1),
        "reservationName" : reservationName,
        "status" : reservationStatusName
    });

    changeTimeDomain(timeDomainString);
    gantt.redraw(reservations);
};

function removeTask() {
    reservations.pop();
    changeTimeDomain(timeDomainString);
    gantt.redraw(reservations);
};


$(document).ready(function () {
    gantt = d3.gantt();
    gantt.reservationTypes(reservationNames);
    gantt.reservationStatus(reservationStatus);
    gantt.tickFormat(format);
    gantt.height(400);
    gantt.width(500);

    gantt.timeDomainMode("fixed");
    changeTimeDomain(timeDomainString);

    gantt(reservations);
});