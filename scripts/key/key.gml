
function get_sprite(_num) {
    switch(_num) {
        case 0:
            return undefined;
        case 1:
            return sWall;
        case 2:
            return sSlopeL;
        case 3:
            return sSlopeR;
        case 4:
            return sPlatform;
        case 5:
            return sEnemy;
        default:
            return undefined;
    }
}