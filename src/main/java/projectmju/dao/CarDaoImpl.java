package projectmju.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import projectmju.model.Busstop;
import projectmju.model.Car;
import projectmju.model.Driver;

import java.util.List;
@Repository
public class CarDaoImpl implements CarDao{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Car> getCars() {
        Session session = sessionFactory.getCurrentSession();
        Query<Car> query = session.createQuery("FROM Car", Car.class);
        List<Car> cars = query.getResultList();
        return cars;
    }


    @Override
    public void saveCar(Car car) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(car);
    }
    @Override
    public Car getCarById(String carId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Car> query = session.createQuery("FROM Car c WHERE c.regplate_no =: cId", Car.class);
        query.setParameter("cId", carId);
        return query.getSingleResult();
    }
    @Override
    public void updateCar(Car car) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(car);
    }


    @Override
    public void deleteCar(Car car) {
        Session session = sessionFactory.getCurrentSession();
        session.remove(car);
    }

    @Override
    public List<Car> getCarsNotNullRouteAndDriver() {
        Session session = sessionFactory.getCurrentSession();
        Query<Car> query = session.createQuery("From Car c WHERE c.driver.id_driver is not null and c.route.id_route is not null order by c.driver.id_driver ASC", Car.class);
        List<Car> cars = query.getResultList();
        return cars;
    }

//    @Override
//    public Car getCarByIdRoute(long routeId) {
//        Session session = sessionFactory.getCurrentSession();
//        Query<Car> query = session.createQuery("", Car.class);
//        return query.getSingleResult();
//    }

    @Override
    public List<Car> getCarByRouteId(long routeId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Car> query = session.createQuery("FROM Car c WHERE c.route.id_route =: rId", Car.class);
        query.setParameter("rId", routeId);
        return query.getResultList();
    }

    @Override
    public List<Car> getCarsByDriverId(long driverId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Car> query = session.createQuery("FROM Car c WHERE c.driver.id_driver =: dId", Car.class);
        query.setParameter("dId", driverId);
        return query.getResultList();
    }

}
